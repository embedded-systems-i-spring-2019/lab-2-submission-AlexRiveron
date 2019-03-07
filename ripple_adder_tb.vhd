----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 08:24:40 PM
-- Design Name: 
-- Module Name: ripple_adder_tb - tb
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
use IEEE.NUMERIC_STD.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_adder_tb is
end ripple_adder_tb;

architecture tb of ripple_adder_tb is

component ripple_adder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin_fa : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
           --Cout : out STD_LOGIC_VECTOR (3 downto 0));
end component;

       signal A_tb : STD_LOGIC_VECTOR (3 downto 0):="0000";
       signal B_tb : STD_LOGIC_VECTOR (3 downto 0):= "0101";
       signal Cout_tb : STD_LOGIC; --_VECTOR (3 downto 0);
       signal Y_tb : STD_LOGIC_VECTOR (3 downto 0);
       signal Cin_tb : STD_LOGIC := '0';
begin

adder_A_proc: process
    begin
    
    wait for 4 ns;
           A_tb <= STD_LOGIC_VECTOR(unsigned(A_tb) + 1);
     end process;  

adder_B_proc: process
    begin
    
    --wait for 64 ns;
    --       B_tb <= STD_LOGIC_VECTOR(unsigned(B_tb) + 1);
     end process; 

ra: ripple_adder
        port map(
            Cin_fa => Cin_tb,
            A => A_tb,
            B => B_tb,
            Y => Y_tb,
            Cout => Cout_tb);
            
       
end;
