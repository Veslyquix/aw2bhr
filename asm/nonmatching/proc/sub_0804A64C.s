	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804A64C
sub_0804A64C: @ 0x0804A64C
	push {r4, r5, lr}
	ldr r5, _0804A688 @ =gUnknown_030044E0
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0x5d
	ldrb r4, [r0]
	adds r0, #2
	ldrb r0, [r0]
	cmp r4, r0
	blo _0804A666
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804A666:
	movs r0, #0x20
	ldrsh r1, [r2, r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	ldrb r2, [r2, #0x1e]
	adds r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0804A18C
	ldr r1, [r5]
	adds r1, #0x2c
	adds r1, r1, r4
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A688: .4byte gUnknown_030044E0

