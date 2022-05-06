library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM_1pulso is
    Port ( actv : in  STD_LOGIC;
				clk,rst : in  STD_LOGIC;
           s : out  STD_LOGIC);
end FSM_1pulso;

architecture Behavioral of FSM_1pulso is
type estados_fsm is (SA,SB);
signal EP,EF : estados_fsm;
begin

Combinacional: process(EP,actv)
begin
	case EP is 
		when SA => s <= '0';
				if (actv = '1') then 
					EF <= SB;
				else 
				EF <= SA;
				end if;
		when SB => s <= '1';
				if (actv = '1') then 
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

