	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F5E4
sub_0803F5E4: @ 0x0803F5E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	cmp r0, #1
	beq _0803F600
	ldr r0, _0803F5F8 @ =gUnknown_080CFFC4
	ldr r7, _0803F5FC @ =gUnknown_080D16C4
	b _0803F604
	.align 2, 0
_0803F5F8: .4byte gUnknown_080CFFC4
_0803F5FC: .4byte gUnknown_080D16C4
_0803F600:
	ldr r0, _0803F6AC @ =gUnknown_080D0B44
	ldr r7, _0803F6B0 @ =gUnknown_080D1BC4
_0803F604:
	ldr r4, _0803F6B4 @ =0x000003FF
	adds r1, r6, #0
	ands r1, r4
	lsls r1, r1, #5
	ldr r5, _0803F6B8 @ =0x06010000
	adds r1, r1, r5
	movs r2, #0xb8
	lsls r2, r2, #4
	bl sub_08011E54
	movs r0, #1
	bl sub_08042DE0
	subs r0, #1
	lsls r0, r0, #3
	ands r0, r4
	lsls r0, r0, #5
	adds r0, r7, r0
	adds r1, r6, #0
	adds r1, #0x5c
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x40
	bl CpuFastSet
	movs r0, #2
	bl sub_08042DE0
	subs r0, #1
	lsls r0, r0, #3
	ands r0, r4
	lsls r0, r0, #5
	adds r0, r7, r0
	adds r1, r6, #0
	adds r1, #0x64
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x40
	bl CpuFastSet
	movs r0, #3
	bl sub_08042DE0
	subs r0, #1
	lsls r0, r0, #3
	ands r0, r4
	lsls r0, r0, #5
	adds r0, r7, r0
	adds r1, r6, #0
	adds r1, #0x6c
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x40
	bl CpuFastSet
	movs r0, #4
	bl sub_08042DE0
	subs r0, #1
	lsls r0, r0, #3
	ands r0, r4
	lsls r0, r0, #5
	adds r0, r7, r0
	adds r1, r6, #0
	adds r1, #0x74
	ands r1, r4
	lsls r1, r1, #5
	adds r1, r1, r5
	movs r2, #0x40
	bl CpuFastSet
	mov r0, r8
	adds r1, r6, #0
	bl sub_0803FD80
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803F6AC: .4byte gUnknown_080D0B44
_0803F6B0: .4byte gUnknown_080D1BC4
_0803F6B4: .4byte 0x000003FF
_0803F6B8: .4byte 0x06010000

