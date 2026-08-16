	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802700C
sub_0802700C: @ 0x0802700C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08027054 @ =gUnknown_08499590
	ldr r3, [r0]
	lsls r2, r2, #1
	ldr r5, _08027058 @ =0x0000417A
	adds r0, r3, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r1
	ldr r1, _0802705C @ =0x00001432
	adds r3, r3, r1
	adds r3, r3, r0
	ldrb r3, [r3]
	asrs r3, r3, #5
	cmp r3, #0
	beq _0802704E
	ldr r0, _08027060 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x2a
	lsls r0, r3, #4
	subs r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x2a
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08027064
_0802704E:
	movs r0, #0
	b _08027066
	.align 2, 0
_08027054: .4byte gUnknown_08499590
_08027058: .4byte 0x0000417A
_0802705C: .4byte 0x00001432
_08027060: .4byte gUnknown_08499598
_08027064:
	movs r0, #1
_08027066:
	pop {r4, r5}
	pop {r1}
	bx r1

