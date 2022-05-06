library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity limites is
    Port ( V : in  STD_LOGIC_VECTOR (9 downto 0);
           H : in  STD_LOGIC_VECTOR (9 downto 0);
           actascV : out  STD_LOGIC;
           actdescV : out  STD_LOGIC;
           actascH : out  STD_LOGIC;
           actdescH : out  STD_LOGIC);
end limites;

architecture Behavioral of limites is

begin

process(V,H)
begin

if (v = 32 or v = 304) then
	if  ((H >= 120 and  H < 296) or (H >= 344 and  H < 520)) then
		actascH <= '1';
	else 
		actascH <= '0';
	end if;
	if ( (H > 120 and H <= 296) or (H > 344 and H <= 520)) then
		actdescH <= '1';
	else 
		actdescH <= '0';
	end if;

elsif (v = 96 or V = 448) then
	if (H >= 120 and H < 520) then 
		actascH <= '1';
	else 
		actascH <= '0';
	end if;
	if (H > 120 and H <= 520) then
		actdescH <= '1';
	else 
		actdescH <= '0';
	end if;
	
elsif ( (v = 144 or V = 400)  ) then
	if (( (H >= 120 and H < 200) or (H >= 248 and H < 296) or (H >= 344 and H < 392) or (H >= 440 and H < 520)  )) then 
		actascH <= '1';
	else 
		actascH <= '0';
	end if;
	if (((H > 120 and H <= 200) or (H > 248 and H <= 296) or (H > 344 and H <= 392) or (H > 440 and H <= 520))) then 
		actdescH <= '1';
	else 
		actdescH <= '0';
	end if;

elsif ( (v = 192 or V = 256)  ) then
	if ( (H >= 248 and H < 392)  ) then 
		actascH <= '1';
	else 
		actascH <= '0';
	end if;
	if ( (H > 248 and H <= 392) ) then 
		actdescH <= '1';
	else 
		actdescH <= '0';
	end if;

elsif ( (v = 224) ) then
	if (((H >= 120 and H < 248) or (H >= 392 and H < 520))   ) then 
		actascH <= '1';
	else 
		actascH <= '0';
	end if;
	if (((H > 120 and H <= 248) or (H > 392 and H <= 520)) ) then 
		actdescH <= '1';
	else 
		actdescH <= '0';
	end if;

elsif ( (v = 352)) then
	if (((H >= 120 and H < 152) or (H >= 200 and H < 440) or (H >= 488 and H < 520))  ) then 
		actascH <= '1';
	else 
		actascH <= '0';
	end if;
	if (((H > 120 and H <= 152) or (H > 200 and H <= 440) or (H > 488 and H <= 520))) then 
		actdescH <= '1';
	else 
		actdescH <= '0';
	end if;
else 
actdescH <= '0';
actascH <= '0';
end if;

if ( ( H = 120 or H = 520) ) then
	if (( ( V >= 32 and V < 144) or ( V >= 304 and V < 352) or ( V >= 400 and V < 448) ) ) then 
		actascV <= '1';
	else 
		actascV <= '0';
	end if;
	if ( ( ( V > 32 and V <= 144) or ( V > 304 and V <= 352) or ( V > 400 and V <= 448) )  ) then 
		actdescV <= '1';
	else 
		actdescV <= '0';
	end if;

elsif ( ( H = 200 or H = 440) ) then
	if (( ( V >= 32 and V < 400) )) then 
		actascV <= '1';
	else 
		actascV <= '0';
	end if;
	if ( ( ( V > 32 and V <= 400) ) ) then 
		actdescV <= '1';
	else 
		actdescV <= '0';
	end if;

elsif ( ( H = 248 or H = 392) ) then
	if (( ( V >= 96 and V < 144) or ( V >= 192 and V < 304) or ( V >= 352 and V < 400) ) ) then 
		actascV <= '1';
	else 
		actascV <= '0';
	end if;
	if ( ( ( V > 96 and V <= 168) or ( V > 192 and V <= 304) or ( V > 352 and V <= 400) )  ) then 
		actdescV <= '1';
	else 
		actdescV <= '0';
	end if;

elsif ( ( H = 296 or H = 344) ) then
	if (( ( V >= 32 and V < 96) or ( V >= 144 and V < 192) or ( V >= 304 and V < 352) or ( V >= 400 and V < 448) )) then 
		actascV <= '1';
	else 
		actascV <= '0';
	end if;
	if (( ( V > 32 and V <= 96) or ( V > 144 and V <= 192) or ( V > 304 and V <= 352) or ( V > 400 and V <= 448) ) ) then 
		actdescV <= '1';
	else 
		actdescV <= '0';
	end if;
elsif ( H = 152 or H = 488) then 
	if ( V >= 352 and V < 400) then 
		actascV <= '1';
	else 
		actascV <= '0';
	end if;
	if ( V > 352 and V <= 400) then  
		actdescV <= '1';
	else 
		actdescV <= '0';
	end if;
else 
actascV <= '0';
actdescV <= '0';
end if;

end process;

end Behavioral;

