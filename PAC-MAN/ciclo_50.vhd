library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ciclo_50 is
    Port ( clk,rst : in  STD_LOGIC;
				sin : in  STD_LOGIC;
           sal : out  STD_LOGIC
			  );
end ciclo_50;

architecture Behavioral of ciclo_50 is
type estados_fsm is (SA,SB);
signal EP,EF : estados_fsm;
begin

Combinacional: process(EP,sin)
begin
	case EP is 
		when SA => sal <= '0';
				if (sin = '1') then 
					EF <= SB;
				else 
				EF <= SA;
				end if;
		when SB => sal <= '1';
				if (sin = '1') then
					EF <= SA;
				else 
					EF <= SB;
				end if;
		end case;
end process Combinacional;

Secuencial: process(clk, rst)
    begin
        if (rst='0') then
            EP <= SA;
         elsif (clk'event and clk='1') then
             EP <= EF;
         end if;
end process Secuencial;


end Behavioral;

