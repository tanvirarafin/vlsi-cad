import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles
import random

@cocotb.test()
async def test_counter(dut):
    clock = Clock(dut.clk, 10, units="us")  # Create a 10us period clock on port clk
    cocotb.fork(clock.start())  # Start the clock

    for i in range(10):
        val = random.randint(0, 1)
        dut.reset <= val  # Assign the random value val to the input port d
        for j in range(5):
            await FallingEdge(dut.clk)
