# CryptoCampo NFT - Trabajo Práctico Final Blockchain

Proyecto de contratos inteligentes desarrollado en **Solidity** y desplegado en la red de pruebas **Ethereum Sepolia**. El sistema permite la compra y gestión de tokens no fungibles (**ERC-721**) utilizando un token fungible (**ERC-20 / BUSD** simulado) como medio de pago.

---

## Descripción del Proyecto

Está compuesto por dos contratos principales:
1. **`BUSD.sol` (ERC-20):** Token utilizado como moneda de intercambio dentro de la plataforma para adquirir los activos digitales.
2. **`CCNFT.sol` (ERC-721):** Contrato principal que gestiona la creación (minting), validación de precios, control de límites por lote y transferencia de propiedad de los NFTs.

Nota: Para hacerlos funcionar en el proyecto, utilicé la versión web de Remix IDE con el fin de conectarme fácilmente a MetaMask. Sin embargo, Remix no encontraba las rutas locales de Foundry (lib/openzeppelin-contracts/...), ya que estas carpetas solo existen en mi computadora y no en la plataforma web. Para solucionarlo y permitir la compilación, reemplacé dichas rutas por las URL oficiales de OpenZeppelin (desde GitHub), las cuales Remix puede descargar de manera automática. Los archivos modificados se encuentran en la carpeta «Contrato para Remix IDE web», mientras que los archivos de la raíz son los que utilicé para Foundry.

---

## Direcciones y Evidencias en Blockchain (Sepolia)

* **Contrato BUSD (ERC-20):**
* **Contrato CCNFT (ERC-721):** 
* **Enlace en Etherscan:** 

Todas las direcciones y evidencias entregadas en la plataforma de Blackboard.

---

## Capturas de Verificación

Las capturas de ejecución (transacción confirmada en Sepolia Etherscan y visualización del NFT importado en MetaMask) se encuentran adjuntas en la plataforma de Blackboard de la meteria.

---

## Por Seguridad

Este repositorio no contiene claves privadas, frases semilla ni archivos de entorno (`.env`).