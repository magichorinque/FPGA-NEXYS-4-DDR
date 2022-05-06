library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Desplegado_H is
   port(
      RST : in  std_logic; -- Reset maestro
      CLK : in  std_logic; -- Reloj maestro
      ST  : in  std_logic; -- Habilitacion de entrada
      HIC : out std_logic  -- Habilitacion de linea
      );
   end Desplegado_H;

architecture Cascada of Desplegado_H is

-- Estados internos
signal Qp, Qn : std_logic_vector (1 downto 0);

-- Detector de 1
signal Z      : std_logic;

-- Incrementador
signal I      : std_logic_vector (1 downto 0);

begin

   Detector: process(Qp)
   begin
      if (Qp="11") then
         Z <= '0';
      else
         Z <= '1';
      end if;
   end process Detector;

   Incrementador: process(Qp)
   begin
      I <= qp+1;
   end process Incrementador;

  -- Anulador: process(Z,I,ST)
  -- begin
   --   Qn  <= ST AND Z AND I;
    --  HIC <= NOT(Z) AND ST;
  -- end process Anulador;


   Anulador: process(Z,I,ST)
   begin
      for j in 0 to 1 loop
         Qn(j) <= ST AND Z AND I(j);
      end loop;
      HIC <= NOT(Z) AND ST;
   end process Anulador;


   Secuencial: process(RST,CLK)
   begin
      if (RST='0') then
         Qp <= "00";
      elsif (CLK'event and CLK='1') then 
         Qp <= Qn;
      end if;
   end process Secuencial;

end Cascada;