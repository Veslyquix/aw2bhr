	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802EC88
sub_0802EC88: @ 0x0802EC88
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r1, #0
	ldr r0, _0802ECE4 @ =0x00007FFF
	cmp r4, r0
	beq _0802ECA8
	ldr r0, _0802ECE8 @ =0x00005FFF
	cmp r4, r0
	bne _0802ECAA
_0802ECA8:
	movs r1, #1
_0802ECAA:
	ldr r0, _0802ECE4 @ =0x00007FFF
	cmp r5, r0
	beq _0802ECB6
	ldr r0, _0802ECE8 @ =0x00005FFF
	cmp r4, r0
	bne _0802ECB8
_0802ECB6:
	adds r1, #1
_0802ECB8:
	ldr r0, _0802ECE4 @ =0x00007FFF
	cmp r2, r0
	beq _0802ECC4
	ldr r0, _0802ECE8 @ =0x00005FFF
	cmp r4, r0
	bne _0802ECC6
_0802ECC4:
	adds r1, #1
_0802ECC6:
	ldr r0, _0802ECE4 @ =0x00007FFF
	cmp r3, r0
	beq _0802ECD2
	ldr r0, _0802ECE8 @ =0x00005FFF
	cmp r4, r0
	bne _0802ECD4
_0802ECD2:
	adds r1, #1
_0802ECD4:
	cmp r1, #0
	ble _0802ECDC
	bl sub_0802EC64
_0802ECDC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802ECE4: .4byte 0x00007FFF
_0802ECE8: .4byte 0x00005FFF

