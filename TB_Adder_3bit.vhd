----------------------------------------------------------------------------------
-- Company: UOM CSE
-- Engineer: Sachithra Vithanage
-- 
-- Create Date: 04/29/2026 04:56:18 PM
-- Design Name: 
-- Module Name: TB_Adder_3bit - Behavioral
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

entity TB_Adder_3bit is

end TB_Adder_3bit;

architecture Behavioral of TB_Adder_3bit is

    COMPONENT Adder_3bit
    PORT(
         PC_in : IN  std_logic_vector(2 downto 0);
         PC_next : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;

    signal PC_in : std_logic_vector(2 downto 0) := (others => '0');
    signal PC_next : std_logic_vector(2 downto 0);

begin

    uut: Adder_3bit PORT MAP (
          PC_in => PC_in,
          PC_next => PC_next
        );

    stim_proc: process
    begin
        -- Testing all 8 possible states to prove functionality and rollover
        PC_in <= "000"; wait for 100 ns; -- Expected: 001 (1)
        PC_in <= "001"; wait for 100 ns; -- Expected: 010 (2)
        PC_in <= "010"; wait for 100 ns; -- Expected: 011 (3)
        PC_in <= "011"; wait for 100 ns; -- Expected: 100 (4)
        PC_in <= "100"; wait for 100 ns; -- Expected: 101 (5)
        PC_in <= "101"; wait for 100 ns; -- Expected: 110 (6)
        PC_in <= "110"; wait for 100 ns; -- Expected: 111 (7)
        PC_in <= "111"; wait for 100 ns; -- Expected: 000 (Rollover to 0)
        
        wait;
    end process;

end Behavioral;
