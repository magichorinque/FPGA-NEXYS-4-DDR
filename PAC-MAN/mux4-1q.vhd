library IEEE;
use IEEE.std_logic_1164.all; -- Libreria estandar

-- Descripcion en caja negra

entity Mux5_4_1 is
   port(
      I0,I1,I2,I3,I4,I5,I6,I7 : in  std_logic_vector(4 downto 0); -- Entradas
      S :           in  std_logic_vector(2 downto 0); -- Seleccion
      Y :           out std_logic_vector(4 downto 0)  -- Salidas
      );
   end Mux5_4_1;

-- Descripcion del circuito

architecture cuadruple of Mux5_4_1 is
   begin
      process(S,I0,I1,I2,I3,I4,I5,I6,I7) -- Declaracion del proceso
         begin
            case S is        -- Declaracion del case
               when "000"   => Y <= I0;  -- Asignacion para S=00
               when "001"   => Y <= I1;  -- Asignacion para S=01
               when "010"   => Y <= I2;  -- Asignacion para S=10
					when "011"   => Y <= I3;
					when "100"   => Y <= I4;
					when "101"   => Y <= I5;
					when "110"   => Y <= I6;
               when others => Y <= I7;  -- Asignacion para S=11
            end case;        -- Fin del case
         end process;        -- Fin del proceso
   end cuadruple;
