	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035C90
sub_08035C90: @ 0x08035C90
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _08035CE0 @ =gUnknown_08499590
	ldr r4, [r0]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, r1, #0
	adds r0, #8
	cmp r0, #0
	bge _08035CAA
	adds r0, #0xf
_08035CAA:
	asrs r0, r0, #4
	lsls r0, r0, #1
	ldr r2, _08035CE4 @ =0x0000417A
	adds r1, r4, r2
	adds r1, r1, r0
	ldrh r2, [r1]
	adds r0, r3, #0
	adds r0, #0x42
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r0, #0
	adds r1, #8
	cmp r1, #0
	bge _08035CC8
	adds r1, #0xf
_08035CC8:
	asrs r1, r1, #4
	adds r1, r2, r1
	ldr r2, _08035CE8 @ =0x00001432
	adds r0, r4, r2
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #2
	beq _08035CEC
	movs r0, #0
	b _08035CEE
	.align 2, 0
_08035CE0: .4byte gUnknown_08499590
_08035CE4: .4byte 0x0000417A
_08035CE8: .4byte 0x00001432
_08035CEC:
	movs r0, #1
_08035CEE:
	pop {r4}
	pop {r1}
	bx r1

