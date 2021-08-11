import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles
from cocotb.triggers import Timer
from model.example_01_mux_model import example_01_mux_model
import random

@cocotb.test()
async def mux_basic_test(dut):
    d0 = 10
    d1 = 20
    s = 0
    dut.d0 <= d0
    dut.d1 <= d1
    dut.s  <= s

    await Timer(2, units='ns')

    assert dut.y.value == example_01_mux_model(s, d0, d1), f"Adder result is incorrect: {dut.y.value} != 1o"


@cocotb.test()
async def mux_randomised_test(dut):
    for i in range(10):
        d0 = random.randint(0, 15)
        d1 = random.randint(0, 15)
        s = random.randint(0,1)

        dut.d0 <= d0
        dut.d1 <= d1
        dut.s <= s
        await Timer(2, units='ns')

        assert dut.y.value == example_01_mux_model(s, d0, d1), "Randomised test failed with: {s}, {d0}, {d1}".format(
            s=dut.s.value, d0=dut.d0.value, d1=dut.d1.value)