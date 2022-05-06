library IEEE;
use IEEE.std_logic_1164.all;

entity BCD_7_segmentos is
   port(
	      B : in  std_logic_vector(4 downto 0); -- Entrada BCD
	      S : out std_logic_vector(7 downto 1)  -- Salida 7 segmentos
     );
end BCD_7_segmentos;




architecture Decodificador of BCD_7_segmentos is  
begin    
	process(B)     
		begin
     	case B is       
			when "00000" => S <= "0000001"; -- Conversion              
			when "00001" => S <= "1001111"; -- de codigo
	      when "00010" => S <= "0010010"; -- S(7) segmento a
			when "00011" => S <= "0000110"; -- S(1) segmento g
			when "00100" => S <= "1001100";
			when "00101" => S <= "0100100";
			when "00110" => S <= "0100000";
			when "00111" => S <= "0001111";
			when "01000" => S <= "0000000";
			when "01001" => S <= "0001100";
			when "01010" => S <= "0001000";
			when "01011" => S <= "1100000";
			when "01100" => S <= "1110010";
			when "01101" => S <= "1000010";
			when "01110" => S <= "0110000";
			when "01111" => S <= "0111000";
			when "10000" => S <= "1111110"; -- guion 
			when "10001" => S <= "1111010"; -- R
			when "10011" => S <= "1100000"; -- B 
			when "10010" => S <= "0000100"; -- G
			when "10100" => S <= "1101010"; -- N
			when others => S <= "-------"; -- No importa
      end case;
	end process;
end Decodificador;
