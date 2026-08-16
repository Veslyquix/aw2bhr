	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070350
sub_08070350: @ 0x08070350
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r7, r2, #0x18
	cmp r6, #0xb2
	bls _08070364
	movs r6, #0xb2
	movs r7, #0xff
	lsls r7, r7, #0x18
_08070364:
	ldr r3, _080703AC @ =gUnknown_081B9DF4
	adds r0, r6, r3
	ldrb r5, [r0]
	ldr r4, _080703B0 @ =gUnknown_081B9EA8
	movs r2, #0xf
	adds r0, r5, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	lsrs r1, r5, #4
	ldr r5, [r0]
	lsrs r5, r1
	adds r0, r6, #1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #2
	adds r0, r0, r4
	lsrs r1, r1, #4
	ldr r0, [r0]
	lsrs r0, r1
	mov r1, ip
	ldr r4, [r1, #4]
	subs r0, r0, r5
	adds r1, r7, #0
	bl sub_0806F734
	adds r1, r0, #0
	adds r1, r5, r1
	adds r0, r4, #0
	bl sub_0806F734
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080703AC: .4byte gUnknown_081B9DF4
_080703B0: .4byte gUnknown_081B9EA8

