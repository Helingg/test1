package com.uit.core

import org.apache.commons.lang.builder.HashCodeBuilder


class RoleMenu implements Serializable {

	
	Role role
	Menu menu

	boolean equals(other) {
		if (!(other instanceof RoleMenu)) {
			return false
		}

		other.menu?.id == menu?.id &&
			other.role?.id == role?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (menu) builder.append(menu.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static RoleMenu get(long menuId, long roleId) {
		find 'from RoleMenu where menu.id=:menuId and role.id=:roleId',
			[menuId: menuId, roleId: roleId]
	}

	static RoleMenu create(Menu menu, Role role, boolean flush = false) {
		new RoleMenu(Menu: menu, role: role).save(flush: flush, insert: true)
	}

	static boolean remove(Menu menu, Role role, boolean flush = false) {
		RoleMenu instance = RoleMenu.findByRoleAndMenu(role,menu)
		instance ? instance.delete(flush: flush) : false
	}

	static void removeAll(Menu menu) {
		executeUpdate 'DELETE FROM RoleMenu WHERE menu=:menu', [menu: menu]
	}

	static void removeAll(Role role) {
		executeUpdate 'DELETE FROM RoleMenu WHERE role=:role', [role: role]
	}

	static mapping = {
		table 'UIT_SYS_ROLEMENU'
		id composite: ['role', 'menu']
		version false
	}
}
