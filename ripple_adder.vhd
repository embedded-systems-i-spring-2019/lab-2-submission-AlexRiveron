----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 08:00:48 PM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral
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

entity ripple_adder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end ripple_adder;

architecture Behavioral of ripple_adder is

component Adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Y : out STD_LOGIC;
           Cout : out STD_LOGIC );
end component;

signal C: STD_LOGIC_VECTOR (2 downto 0);


begin

    a0: adder
    port map(
        A => A(0),
        B => B(0),
        Cin => Cin,
        Cout => C(0),
        Y => Y(0));
        
    a1: adder
    port map(
        A => A(1),
        B => B(1),
        Cin => C(0),
        Cout => C(1),
        Y => Y(1));
    
    a2: adder
    port map(
        A => A(2),
        B => B(2),
        Cin => C(1),
        Cout => C(2),
        Y => Y(2));    
    
    a3: adder
    port map(
        A => A(3),
        B => B(3),
        Cin => C(2),
        Cout => Cout,
        Y => Y(3));    

    
end Behavioral;
