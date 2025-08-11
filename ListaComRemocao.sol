// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ListaComRemocao {

    uint256[] private items;

    event ItemAdicionado(uint256 value, uint256 index);
    event ItemRemovido(uint256 value, uint256 index);

    function adicionar(uint256 _value) public {
        items.push(_value);
        emit ItemAdicionado(_value, items.length - 1);
    }

    function obter(uint256 _index) public view returns (uint256) {
        require(_index < items.length, "Indice fora do intervalo");
        return items[_index];
    }

    function obterTodos() public view returns (uint256[] memory) {
        return items;
    }

    function tamanho() public view returns (uint256) {
        return items.length;
    }

    // REMOÇÃO PRESERVANDO A ORDEM
    function removerPreservandoOrdem(uint256 _index) public {
        require(_index < items.length, "Indice fora do intervalo");

        uint256 removedValue = items[_index];

        for (uint256 i = _index; i < items.length - 1; i++) {
            items[i] = items[i + 1];
        }

        items.pop();

        emit ItemRemovido(removedValue, _index);
    }

    // REMOÇÃO RÁPIDA (SWAP + POP)
    function removerSwap(uint256 _index) public {
        require(_index < items.length, "Indice fora do intervalo");

        uint256 lastIndex = items.length - 1;
        uint256 removedValue = items[_index]; // corrigido nome

        if (_index != lastIndex) {
            items[_index] = items[lastIndex];
        }

        items.pop();

        emit ItemRemovido(removedValue, _index); // corrigido nome
    }
}
