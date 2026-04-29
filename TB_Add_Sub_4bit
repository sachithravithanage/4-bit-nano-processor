----------------------------------------------------------------------------------
-- Company: UOM CSE
-- Engineer: Sachithra Vithanage
-- 
-- Create Date: 04/29/2026 04:35:22 PM
-- Design Name: 
-- Module Name: TB_Add_Sub_4bit - Behavioral
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

entity TB_Add_Sub_4bit is

end TB_Add_Sub_4bit;

architecture Behavioral of TB_Add_Sub_4bit is

    COMPONENT Add_Sub_4bit
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Ctrl : IN  std_logic;
         S : OUT  std_logic_vector(3 downto 0);
         Overflow : OUT  std_logic;
         Zero : OUT  std_logic
        );
    END COMPONENT;
    
    signal A : std_logic_vector(3 downto 0) := (others => '0');
    signal B : std_logic_vector(3 downto 0) := (others => '0');
    signal Ctrl : std_logic := '0';
    
    signal S : std_logic_vector(3 downto 0);
    signal Overflow : std_logic;
    signal Zero : std_logic;

begin

    uut: Add_Sub_4bit PORT MAP (
          A => A,
          B => B,
          Ctrl => Ctrl,
          S => S,
          Overflow => Overflow,
          Zero => Zero
        );

    stim_proc: process
    begin		
        -- Test Case 1: Normal Addition (3 + 2 = 5)
        -- Ctrl = 0 means Add
        Ctrl <= '0';
        A <= "0011"; -- 3
        B <= "0010"; -- 2
        wait for 100 ns;	
        
        -- Test Case 2: Normal Subtraction (5 - 2 = 3)
        -- Ctrl = 1 means Subtract
        Ctrl <= '1';
        A <= "0101"; -- 5
        B <= "0010"; -- 2
        wait for 100 ns;

        -- Test Case 3: Testing the Zero Flag (4 - 4 = 0)
        Ctrl <= '1';
        A <= "0100"; -- 4
        B <= "0100"; -- 4
        wait for 100 ns;
        
        -- Test Case 4: Testing Positive Overflow (7 + 1 = -8)
        -- In 4-bit 2's complement, max positive number is 7 (0111).
        -- Adding 1 causes an overflow into the sign bit.
        Ctrl <= '0';
        A <= "0111"; -- 7
        B <= "0001"; -- 1
        wait for 100 ns;

        -- Test Case 5: Testing Negative Overflow (-8 - 1 = 7)
        -- Min negative number is -8 (1000). Subtracting 1 overflows to positive.
        Ctrl <= '1';
        A <= "1000"; -- -8
        B <= "0001"; -- 1
        wait for 100 ns;
        
        -- Index test cases - Index No. : 240690D
        -- Index Case 1: Addition 
        -- 0011 (3) + 1010 (-6) = 1101 (-3)
        Ctrl <= '0';
        A <= "0011"; 
        B <= "1010"; 
        wait for 100 ns;
        
        -- Index Case 2: Subtraction 
        -- 1100 (-4) - 0010 (2) = 1010 (-6)
        Ctrl <= '1';
        A <= "1100"; 
        B <= "0010"; 
        wait for 100 ns;
        
        -- Index Case 3: Addition 
        -- 1100 (-4) + 0011 (3) = 1111 (-1)
        Ctrl <= '0';
        A <= "1100"; 
        B <= "0011"; 
        wait for 100 ns;
        
        -- Index Case 4: Subtraction 
        -- 0011 (3) - 1100 (-4) = 0111 (7)
        Ctrl <= '1';
        A <= "0011"; 
        B <= "1100"; 
        wait for 100 ns;        

        wait;
    end process;

end Behavioral;
