	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08062038
sub_08062038: @ 0x08062038
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _08062090 @ =gUnknown_0816DB28
	ldr r0, [r2]
	ldrh r6, [r0]
	ldr r0, _08062094 @ =gUnknown_030046B8
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	mov sb, r2
	cmp r0, #0
	beq _08062084
	movs r4, #1
	ldr r0, _08062098 @ =gUnknown_0816DB2C
	mov r8, r0
	ldr r7, [r0]
_0806205C:
	mov r1, sb
	ldr r5, [r1]
	strh r4, [r5]
	strh r4, [r7]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08062076
	bl sub_0806209C
_08062076:
	adds r4, #1
	cmp r4, #4
	ble _0806205C
	mov r1, r8
	ldr r0, [r1]
	strh r6, [r5]
	strh r6, [r0]
_08062084:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062090: .4byte gUnknown_0816DB28
_08062094: .4byte gUnknown_030046B8
_08062098: .4byte gUnknown_0816DB2C

