library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity asc_desc_contador_BCD is
    Port ( clk : in  STD_LOGIC;
           e,ad,ad1 : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  tc : out  std_logic;
           Y : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end asc_desc_contador_BCD;

architecture Behavioral of asc_desc_contador_BCD is
signal Estado_Presente, Estado_Proximo : std_logic_vector(3 downto 0);
begin

 Combinacional: process(Estado_Presente,e,ad,ad1)
	  begin				 
		  if (e='1') then 
				if (ad = '1') then
					case Estado_Presente is
						when "0000" => Estado_Proximo <= "0001";  	 tc <= '0';
						when "0001" => Estado_Proximo <= "0010";	    tc <= '0';
						when "0010" => Estado_Proximo <= "0011";	 	 tc <= '0';
						when "0011" => Estado_Proximo <= "0100";	    tc <= '0';
						when "0100" => Estado_Proximo <= "0101";   	 tc <= '0';
						when "0101" => Estado_Proximo <= "0110";		 tc <= '0';
						when "0110" => Estado_Proximo <= "0111";	    tc <= '0';
						when "0111" => Estado_Proximo <= "1000";		 tc <= '0';
						when "1000" => Estado_Proximo <= "1001";		 tc <= '0';
						when others => Estado_Proximo <= "0000";	 	 tc <= '1';
					end case;
			  elsif (ad1='1') then 
					case Estado_Presente is
						when "1001" => Estado_Proximo <= "1000";  	 tc <= '0';
						when "1000" => Estado_Proximo <= "0111";	    tc <= '0';
						when "0111" => Estado_Proximo <= "0110";	 	 tc <= '0';
						when "0110" => Estado_Proximo <= "0101";	    tc <= '0';
						when "0101" => Estado_Proximo <= "0100";   	 tc <= '0';
						when "0100" => Estado_Proximo <= "0011";		 tc <= '0';
						when "0011" => Estado_Proximo <= "0010";	    tc <= '0';
						when "0010" => Estado_Proximo <= "0001";		 tc <= '0';
						when "0001" => Estado_Proximo <= "0000";		 tc <= '0';
						when others => Estado_Proximo <= "1001";	 	 tc <= '1';
					end case;
					else 
					Estado_Proximo <= estado_presente;tc <= '0';
				end if;
		  else 
			  Estado_Proximo <= estado_presente;tc <= '0';
		  end if;
		  
            Y <= Estado_Presente;
         end process Combinacional;	

Secuencial: process(Clk, Rst)
         begin
            if (Rst='0') then
               Estado_Presente <= "0000";
            elsif (Clk'event and Clk='1') then
               Estado_Presente <= Estado_Proximo;
            end if;
end process Secuencial;

end Behavioral;

