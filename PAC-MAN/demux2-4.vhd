library IEEE;
use IEEE.std_logic_1164.all;

entity Demux_1_8 is
   port(
      X : in  std_logic;                    -- Entrada
      S : in  std_logic_vector(2 downto 0); -- Seleccion
      Y : out std_logic_vector(7 downto 0)  -- Salidas
      );
   end Demux_1_8;

architecture simple of Demux_1_8 is
   begin
      process(X,S)
         begin
            Y <= (others => '1'); -- Valores por omision
            case S is
               when "000"   => Y(0) <= X; -- Asignacion concurrente
               when "001"   => Y(1) <= X; -- Asignacion concurrente
               when "010"   => Y(2) <= X; -- Asignacion concurrente
					when "011"   => Y(3) <= X;
					when "100"   => Y(4) <= X;
					when "101"   => Y(5) <= X;
					when "110"   => Y(6) <= X;
               when others => Y(7) <= X; -- Asignacion concurrente
            end case;
         end process;
   end simple;
