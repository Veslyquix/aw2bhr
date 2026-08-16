	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08058DEC
sub_08058DEC: @ 0x08058DEC
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r1, _08058E64 @ =gUnknown_085D5ABC
	ldr r0, _08058E68 @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r2, [r0]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r1, #0x14
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r0, _08058E6C @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r4, _08058E70 @ =0x0000417A
	adds r0, r1, r4
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r7
	ldr r2, _08058E74 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0x1f
	ands r0, r1
	adds r3, #0x1a
	adds r3, r3, r0
	ldrb r0, [r3]
	cmp r0, #0
	beq _08058E7C
	ldr r4, _08058E78 @ =0x0000270F
	strh r4, [r5]
	subs r0, r7, #1
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_08058E88
	adds r0, r7, #1
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_08058E88
	subs r1, r6, #1
	adds r0, r7, #0
	adds r2, r5, #0
	bl sub_08058E88
	adds r1, r6, #1
	adds r0, r7, #0
	adds r2, r5, #0
	bl sub_08058E88
	ldrh r0, [r5]
	cmp r0, r4
	beq _08058E7C
	movs r0, #0
	b _08058E80
	.align 2, 0
_08058E64: .4byte gUnknown_085D5ABC
_08058E68: .4byte gUnknown_030040D8
_08058E6C: .4byte gUnknown_08499590
_08058E70: .4byte 0x0000417A
_08058E74: .4byte 0x00001432
_08058E78: .4byte 0x0000270F
_08058E7C:
	movs r0, #1
	rsbs r0, r0, #0
_08058E80:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

