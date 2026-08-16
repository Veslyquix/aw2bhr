	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070E4C
sub_08070E4C: @ 0x08070E4C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	cmp r0, #4
	bne _08070E84
	cmp r5, #0x14
	bhi _08070E68
	movs r5, #0
	b _08070E76
_08070E68:
	adds r0, r5, #0
	subs r0, #0x15
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x3b
	bls _08070E76
	movs r5, #0x3b
_08070E76:
	ldr r0, _08070E80 @ =gUnknown_081B9F8C
	adds r0, r5, r0
	ldrb r0, [r0]
	b _08070EE6
	.align 2, 0
_08070E80: .4byte gUnknown_081B9F8C
_08070E84:
	cmp r5, #0x23
	bhi _08070E90
	movs r0, #0
	mov ip, r0
	movs r5, #0
	b _08070EA2
_08070E90:
	adds r0, r5, #0
	subs r0, #0x24
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x82
	bls _08070EA2
	movs r5, #0x82
	movs r1, #0xff
	mov ip, r1
_08070EA2:
	ldr r3, _08070EEC @ =gUnknown_081B9EF0
	adds r0, r5, r3
	ldrb r6, [r0]
	ldr r4, _08070EF0 @ =gUnknown_081B9F74
	movs r2, #0xf
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r7, #0
	ldrsh r1, [r0, r7]
	asrs r0, r6, #4
	adds r6, r1, #0
	asrs r6, r0
	adds r0, r5, #1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r1, r1, #4
	asrs r0, r1
	subs r0, r0, r6
	mov r7, ip
	muls r7, r0, r7
	adds r0, r7, #0
	asrs r0, r0, #8
	adds r0, r6, r0
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
_08070EE6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08070EEC: .4byte gUnknown_081B9EF0
_08070EF0: .4byte gUnknown_081B9F74

