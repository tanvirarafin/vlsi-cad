import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles
import random

@cocotb.test()
async def test_adder(dut):
    clock = Clock(dut.clk, 10, units="ns")  # Create a 1nus period clock on port clk
    cocotb.fork(clock.start())  # Start the clock

    for i in range(10):
        val_a = random.randint(0, 255)
        val_b = random.randint(0, 255)
        val_cin = random.randint(0, 1)
        dut.reset <= 0
        dut.a <= val_a  # Assign the random value val to the input port d
        dut.b <= val_b
        dut.cin <= val_cin

        for j in range(5):
            await FallingEdge(dut.clk)
        if (val_a +val_b +val_cin > 255):
            assert dut.cout == 1
        else:
            assert dut.s == val_a+val_b+val_cin
            assert dut.cout == 0

        dut.reset <=1
        await  FallingEdge(dut.clk)
	
