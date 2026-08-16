	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F41C
sub_0806F41C: @ 0x0806F41C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _0806F47C @ =gUnknown_030030CC
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r6, #0x7f
	ands r0, r6
	strb r0, [r2, #1]
	bl sub_08012358
	movs r0, #0x22
	bl sub_0803CBD8
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r7, r1, #0x1f
	ldr r0, _0806F480 @ =gUnknown_08582AF4
	bl Proc_EndEach
	adds r4, r5, #0
	adds r4, #0x38
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r1, r5, #0
	bl sub_0806E210
	ldr r2, _0806F484 @ =gUnknown_0816E808
	ldr r1, [r2]
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #0xd]
	adds r3, r2, #0
	cmp r0, #1
	bne _0806F48C
	ldr r0, _0806F488 @ =gUnknown_03002B6C
	ldrb r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r0]
	b _0806F496
	.align 2, 0
_0806F47C: .4byte gUnknown_030030CC
_0806F480: .4byte gUnknown_08582AF4
_0806F484: .4byte gUnknown_0816E808
_0806F488: .4byte gUnknown_03002B6C
_0806F48C:
	ldr r2, _0806F4CC @ =gUnknown_03002B6C
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	strb r0, [r2]
_0806F496:
	ldr r6, [r3]
	adds r4, r5, #0
	adds r4, #0x38
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	adds r0, r0, r6
	ldrh r0, [r0, #0xe]
	cmp r0, #0
	beq _0806F4AE
	cmp r7, #0
	beq _0806F510
_0806F4AE:
	ldr r0, _0806F4D0 @ =gUnknown_08582CAC
	bl Proc_EndEach
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #4
	adds r0, r0, r6
	ldr r0, [r0]
	cmp r0, #0x11
	bhi _0806F4D4
	adds r0, r1, #0
	bl sub_0806AEC4
	b _0806F53A
	.align 2, 0
_0806F4CC: .4byte gUnknown_03002B6C
_0806F4D0: .4byte gUnknown_08582CAC
_0806F4D4:
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl sub_08011CAC
_0806F4DC:
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #4
	adds r1, r6, #4
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0806F50C @ =gUnknown_08499578
	ldr r1, [r1]
	bl sub_08011CAC
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	adds r0, r6, #0
	adds r0, #8
	adds r0, r1, r0
	ldr r0, [r0]
	adds r1, r1, r6
	ldrb r2, [r1, #0xc]
	lsls r2, r2, #5
	movs r1, #0
	bl sub_08013618
	b _0806F53A
	.align 2, 0
_0806F50C: .4byte gUnknown_08499578
_0806F510:
	ldr r4, _0806F548 @ =gUnknown_08582CAC
	adds r0, r4, #0
	bl Proc_EndEach
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	str r7, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _0806F54C @ =0x01000010
	mov r0, sp
	bl CpuFastSet
	bl sub_08013C00
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
_0806F53A:
	bl sub_08013AEC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F548: .4byte gUnknown_08582CAC
_0806F54C: .4byte 0x01000010

