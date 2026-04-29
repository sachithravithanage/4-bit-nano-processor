----------------------------------------------------------------------------------
-- Company: UOM CSE
-- Engineer: Sachithra Vithanage
-- 
-- Create Date: 04/29/2026 04:53:45 PM
-- Design Name: 
-- Module Name: Adder_3bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder_3bit is
    Port ( PC_in : in STD_LOGIC_VECTOR (2 downto 0);
           PC_next : out STD_LOGIC_VECTOR (2 downto 0));
end Adder_3bit;

architecture Minimal of Adder_3bit is
begin
    -- Hardcoded optimized logic for PC + 1
    PC_next(0) <= not PC_in(0);
    PC_next(1) <= PC_in(1) xor PC_in(0);
    PC_next(2) <= PC_in(2) xor (PC_in(1) and PC_in(0));
end Minimal;
