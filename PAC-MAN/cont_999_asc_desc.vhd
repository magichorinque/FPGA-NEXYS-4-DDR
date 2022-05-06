library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cont_999_asc_desc is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           e : in  STD_LOGIC;
           ad : in  STD_LOGIC;
           ad1 : in  STD_LOGIC;
           s1 : out  STD_LOGIC_VECTOR (3 downto 0);
           s2 : out  STD_LOGIC_VECTOR (3 downto 0);
           tc : out  STD_LOGIC);
end cont_999_asc_desc;

architecture Behavioral of cont_999_asc_desc is

component asc_desc_contador_BCD is
    Port ( clk : in  STD_LOGIC;
           e,ad,ad1 : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  tc : out  std_logic;
           Y : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

signal tc1,tc2,tc3,tc4,e1,e2,e3 : STD_LOGIC;

begin

c1: asc_desc_contador_BCD port map (clk,e,ad,ad1,rst,tc1,s1);
e1<= tc1 and e;
c2: asc_desc_contador_BCD port map (clk,e1,ad,ad1,rst,tc2,s2);
tc<= tc2 and e1;

end Behavioral;

