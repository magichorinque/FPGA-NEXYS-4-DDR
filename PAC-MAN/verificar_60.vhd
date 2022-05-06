library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity verificar_60 is
    Port ( clk,rst : in  STD_LOGIC;
			  u : in  STD_LOGIC_VECTOR (3 downto 0);
           d : in  STD_LOGIC_VECTOR (3 downto 0);
           s1 : out  STD_LOGIC;
           s2 : out  STD_LOGIC);
end verificar_60;

architecture Behavioral of verificar_60 is
type estados_fsm is (SA,SB,SC,SD);
signal EP,EF : estados_fsm;
signal aux : STD_LOGIC;
begin

detector: process (u,d)
begin
if(d = "0110")then 

	if(u = "0000") then 
	aux <= '1';
	else 
	aux <= '0';
	end if;
else 
aux <= '0';
end if;

end process detector;

Combinacional: process(EP,aux)
begin
	case EP is 
		when SA => s1 <= '1';
						s2 <= '0';
				if (aux = '1') then 
					EF <= SB;
				else 
				EF <= SA;
				end if;
		when SB => s1 <= '0';
						s2 <= '0';
					EF <= SC;
		when SC => s1 <= '1';
						s2 <= '1';
					EF <= SA;
		when SD => s1 <= '0';
						s2 <= '0';
					EF <= SA;
		end case;
end process Combinacional;

Secuencial: process(clk, rst)
    begin
        if (rst='0') then
            EP <= SD;
			elsif (clk'event and clk='1') then
             EP <= EF;
         end if;
end process Secuencial;


end Behavioral;

