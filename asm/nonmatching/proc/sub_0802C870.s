	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802C870
sub_0802C870: @ 0x0802C870
	push {r4, lr}
	movs r2, #1
	ldr r4, _0802C880 @ =gUnknown_08499594
	ldr r3, _0802C884 @ =gUnknown_03003F2C
	ldrh r0, [r3]
	adds r0, #1
	b _0802C89C
	.align 2, 0
_0802C880: .4byte gUnknown_08499594
_0802C884: .4byte gUnknown_03003F2C
_0802C888:
	lsls r0, r2, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r2, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x32
	bgt _0802C8AC
	ldrh r0, [r3]
	adds r0, r0, r1
_0802C89C:
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802C888
_0802C8AC:
	cmp r2, #0x33
	beq _0802C8B4
	movs r0, #0
	b _0802C8B6
_0802C8B4:
	movs r0, #2
_0802C8B6:
	pop {r4}
	pop {r1}
	bx r1

