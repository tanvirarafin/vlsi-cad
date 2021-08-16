import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer
from model.example_mux2_model import example_mux2
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles
import random

@cocotb.test()
async def mux2_basic_test(dut):
    d0 = 10
    d1 = 5
    s =0
    dut.d0 <= d0
    dut.d1 <= d1
    dut.s <= s

    await Timer(2, units='ns')

    assert dut.y.value == example_mux2(s, d0, d1), f"Mux result is incorrect: {dut.y.value}"

@cocotb.test()
async def mux2_randomised_test(dut):
    for i in range(1000):
        d0 = random.randint(0, 15)
        d1 = random.randint(0, 15)
        s = random.randint(0,1)
        dut.d0 <= d0
        dut.d1 <= d1
        dut.s   <= s

        await Timer(2, units='ns')

        assert dut.y.value == example_mux2(s, d0, d1), "Randomised test failed with: {a}, {b}"
