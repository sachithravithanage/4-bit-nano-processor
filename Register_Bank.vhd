----------------------------------------------------------------------------------
-- Company: UOM CSE
-- Engineer: Sachithra Vithanage
-- 
-- Create Date: 04/29/2026 05:07:55 PM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC; -- Connects to the push button to clear everything
           RegEn : in STD_LOGIC_VECTOR (2 downto 0); -- 3-bit address from Instruction Decoder
           DataIn : in STD_LOGIC_VECTOR (3 downto 0);
           R0, R1, R2, R3, R4, R5, R6, R7 : out STD_LOGIC_VECTOR (3 downto 0));
end Register_Bank;

architecture Behavioral of Register_Bank is
    -- We only create an array for R1 through R7. This saves 4 Flip-Flops!
    type reg_array is array (1 to 7) of STD_LOGIC_VECTOR(3 downto 0);
    signal registers : reg_array := (others => "0000");
begin
    process(Clk, Reset)
    begin
        if Reset = '1' then
            -- Asynchronous Reset: Clears all writable registers immediately when pushed
            registers(1) <= "0000";
            registers(2) <= "0000";
            registers(3) <= "0000";
            registers(4) <= "0000";
            registers(5) <= "0000";
            registers(6) <= "0000";
            registers(7) <= "0000";
            
        elsif rising_edge(Clk) then
            -- 3-to-8 Decoder Logic built directly into the process
            case RegEn is
                when "001" => registers(1) <= DataIn;
                when "010" => registers(2) <= DataIn;
                when "011" => registers(3) <= DataIn;
                when "100" => registers(4) <= DataIn;
                when "101" => registers(5) <= DataIn;
                when "110" => registers(6) <= DataIn;
                when "111" => registers(7) <= DataIn;
                when others => null; -- "000" lands here. Prevents overwriting R0.
            end case;
        end if;
    end process;

    -- Output routing. R0 is safely hardcoded to ground forever.
    R0 <= "0000";
    R1 <= registers(1);
    R2 <= registers(2);
    R3 <= registers(3);
    R4 <= registers(4);
    R5 <= registers(5);
    R6 <= registers(6);
    R7 <= registers(7);
end Behavioral;
