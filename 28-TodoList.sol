// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({text: _text, completed: false}));
    }

    function updateText(uint256 _index, string calldata _text) external {
        todos[_index].text = _text;

        // 只更新一个上面方法节省资源
        // Todo storage todo = todos[_index];
        // todo.text = _text;
    }

    function get(uint256 _index) external view returns (string memory, bool) {
        // storage 29397
        // memory 28480
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
    }


    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}
