----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2019 03:45:44 PM
-- Design Name: 
-- Module Name: alu_tester - Behavioral
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

entity alu_tester is
    Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
           btn : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (3 downto 0));
end alu_tester;

architecture Behavioral of alu_tester is


component debounce is 
    Port ( btn : in STD_LOGIC;   
       clk : in STD_LOGIC;   
       dbnc : out STD_LOGIC);
 end component;
 
 component my_alu is
    Port (
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           opcode : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal db_bt, A_n, B_n, opcode_n : STD_LOGIC_VECTOR (3 downto 0);
begin

    process(btn, sw, clk)
    begin
    if (rising_edge(clk)) then
        case (db_bt) is
            when "0001" => A_n <= sw;
            when "0010" => B_n <= sw;
            when "0100" => opcode_n <= sw;
            when "1000" => A_n <= "0000";
                B_n <= "0000";
                opcode_n <= "0000";
        end case;
    end if;
    end process;

    d0: debounce port map (
        btn => btn(0),
        clk => clk,
        dbnc => db_bt(0));
    d1: debounce port map (
            btn => btn(1),
            clk => clk,
            dbnc => db_bt(1));
    d2: debounce port map (
            btn => btn(2),
            clk => clk,
            dbnc => db_bt(2));   
    d3: debounce port map (
            btn => btn(3),
            clk => clk,
            dbnc => db_bt(3)); 
    a0: my_alu port map (
            A => A_n,
            B => B_n,
            opcode => opcode_n,
            Y => led);
end Behavioral;
