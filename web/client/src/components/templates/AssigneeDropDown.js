import React, { useState, useEffect } from 'react';
import DropDown from '../organisms/DropDown';

const AssigneeDropDown = ({ children }) => {
    const [users, setUsers] = useState(null);

    useEffect(() => {
        const getusers = () => {
            fetch('http://49.50.160.103:3000/users')
                .then((res) => res.json())
                .then((res) => {
                    setUsers(res.data);
                });
        };
        getusers();
    }, []);
    if (!users) return <div></div>;

    return (
        <DropDown items={users} subject="Assignees" style={{ float: 'right' }}>
            {children}
        </DropDown>
    );
};

export default AssigneeDropDown;
