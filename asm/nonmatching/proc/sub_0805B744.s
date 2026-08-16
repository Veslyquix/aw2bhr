	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805B744
sub_0805B744: @ 0x0805B744
	push {lr}
	sub sp, #4
	ldr r0, _0805B774 @ =gUnknown_030040D8
	ldr r0, [r0]
	bl sub_080202A4
	bl sub_0805B980
	mov r0, sp
	bl sub_0805B8F4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805B768
	mov r0, sp
	bl sub_0805B814
_0805B768:
	bl sub_0805B778
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0805B774: .4byte gUnknown_030040D8

