	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080422A8
sub_080422A8: @ 0x080422A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _08042340 @ =gUnknown_08499590
	mov sl, r2
	ldr r2, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0xf
	mov r8, r1
	ldr r3, _08042344 @ =0x0000417A
	mov sb, r3
	adds r1, r2, r3
	add r1, r8
	ldrh r1, [r1]
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	adds r1, r1, r7
	adds r2, #0x12
	adds r2, r2, r1
	ldrb r1, [r2]
	ldr r5, _08042348 @ =gUnknown_08499594
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r4, r0, #2
	ldr r0, [r5]
	adds r6, r0, r4
	cmp r1, #0
	beq _0804235C
	adds r0, r1, #0
	ldr r1, _0804234C @ =gUnknown_03003F38
	ldrb r1, [r1]
	bl sub_08026F9C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804235C
	ldr r0, [r5]
	adds r0, r0, r4
	ldr r1, _08042350 @ =gUnknown_030040D8
	ldr r1, [r1]
	ldrb r1, [r1]
	bl sub_08025F74
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804235C
	ldr r1, _08042354 @ =gUnknown_085D5ABC
	ldrb r2, [r6]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r1, #0x14
	adds r0, r0, r1
	ldr r2, [r0]
	mov r0, sl
	ldr r1, [r0]
	mov r3, sb
	adds r0, r1, r3
	add r0, r8
	ldrh r0, [r0]
	adds r0, r0, r7
	ldr r3, _08042358 @ =0x00001432
	adds r1, r1, r3
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0x1f
	ands r0, r1
	adds r2, #0x1a
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _0804235C
	movs r0, #1
	b _0804235E
	.align 2, 0
_08042340: .4byte gUnknown_08499590
_08042344: .4byte 0x0000417A
_08042348: .4byte gUnknown_08499594
_0804234C: .4byte gUnknown_03003F38
_08042350: .4byte gUnknown_030040D8
_08042354: .4byte gUnknown_085D5ABC
_08042358: .4byte 0x00001432
_0804235C:
	movs r0, #0
_0804235E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

