library IEEE;
use IEEE.std_logic_1164.all;

entity Contador_10 is
   port(
      Clk : in  std_logic;                    -- Reloj
      Rst,e : in  std_logic;                    -- Reset	  
	   tc : out  std_logic;
      Y   : out std_logic_vector(3 downto 0)  -- Salidas
      );
end Contador_10;		 

architecture Machine of Contador_10 is
signal Estado_Presente, Estado_Proximo : std_logic_vector(3 downto 0);
   begin
      Combinacional: process(Estado_Presente,e)
	  begin				 
		  if (e='1') then 
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
   end Machine;
