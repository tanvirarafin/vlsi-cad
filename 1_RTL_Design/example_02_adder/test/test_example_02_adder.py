import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer
from model.example_02_adder_model import example_02_adder
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles
import random

@cocotb.test()
async def adder_basic_test(dut):
    a = 10
    b = 20
    dut.a <= a
    dut.b <= b

    await Timer(2, units='ns')

    assert dut.y.value == example_02_adder(a, b), f"Adder result is incorrect: {dut.y.value}"


@cocotb.test()
async def adder_randomised_test(dut):
    for i in range(1000):
        a = random.randint(0, 2147483647)
        b = random.randint(0, 2147483647)
        dut.a <= a
        dut.b <= b

        await Timer(2, units='ns')

        assert dut.y.value == example_02_adder(a, b), "Randomised test failed with: {a}, {b}"