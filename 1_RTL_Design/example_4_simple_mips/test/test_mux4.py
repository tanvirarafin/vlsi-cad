import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles
import random

@cocotb.test()
async def test_mux4(dut):
    clock = Clock(dut.clk, 10, units="us")
    cocotb.fork(clock.start())

    # test for some random instances
    test_instance = 10
    for i in range(test_instance):
        d0 = random.randint(0, 255)
        d1 = random.randint(0, 255)
        d2 = random.randint(0, 255)
        d3 = random.randint(0, 255)

        dut.d0 <= d0
        dut.d1 <= d1
        dut.d2 <= d2
        dut.d3 <= d3
        for j in range(4):
            dut.s <=  j
            #print(dut.y, dut.d0, dut.d1, dut.d2, dut.d3)
            if j==0:
                if (dut.y != d0):
                    print(dut.s, dut.y, dut.d0, dut.d1, dut.d2, dut.d3)
            elif j==1:
                pass
                #assert dut.y == dut.d1
            elif j==2:
                pass
                #assert dut.y == dut.d2
            else:
                pass
                #assert dut.y == dut.d3
            await FallingEdge(dut.clk)


