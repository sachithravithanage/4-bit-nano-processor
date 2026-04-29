----------------------------------------------------------------------------------
-- Company: UOM CSE
-- Engineer: Sachithra Vithanage
-- 
-- Create Date: 04/29/2026 05:10:04 PM
-- Design Name: 
-- Module Name: TB_Register_Bank - Behavioral
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

entity TB_Register_Bank is
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is

    COMPONENT Register_Bank
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         RegEn : IN  std_logic_vector(2 downto 0);
         DataIn : IN  std_logic_vector(3 downto 0);
         R0, R1, R2, R3, R4, R5, R6, R7 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;

    signal Clk : std_logic := '0';
    signal Reset : std_logic := '0';
    signal RegEn : std_logic_vector(2 downto 0) := "000";
    signal DataIn : std_logic_vector(3 downto 0) := "0000";

    signal R0, R1, R2, R3, R4, R5, R6, R7 : std_logic_vector(3 downto 0);

    constant Clk_period : time := 10 ns;

begin

    uut: Register_Bank PORT MAP (
          Clk => Clk,
          Reset => Reset,
          RegEn => RegEn,
          DataIn => DataIn,
          R0 => R0, R1 => R1, R2 => R2, R3 => R3,
          R4 => R4, R5 => R5, R6 => R6, R7 => R7
        );

    clk_process :process
    begin
        Clk <= '0';
        wait for Clk_period/2;
        Clk <= '1';
        wait for Clk_period/2;
    end process;

    stim_proc: process
    begin		
        -- Step 1: Prove R0 cannot be overwritten
        RegEn <= "000";
        DataIn <= "1111"; 
        wait for Clk_period*2;
        -- R0 should still be "0000" on the waveform
        
        -- Step 2: Write to R1
        RegEn <= "001";
        DataIn <= "1010"; -- Hex 'a'
        wait for Clk_period*2;
        
        -- Step 3: Write to R7
        RegEn <= "111";
        DataIn <= "0101"; -- Hex '5'
        wait for Clk_period*2;
        
        -- Step 4: Stop writing (point to R0) and change DataIn
        RegEn <= "000";
        DataIn <= "1001"; 
        wait for Clk_period*2;
        -- R1 and R7 should hold their old values!
        
        -- Step 5: Test the Asynchronous Reset
        Reset <= '1';
        wait for Clk_period;
        Reset <= '0';
        -- Everything should wipe back to "0000"
        
        wait;
    end process;

end Behavioral;
