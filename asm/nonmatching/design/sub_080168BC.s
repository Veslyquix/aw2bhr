	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080168BC
sub_080168BC: @ 0x080168BC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _08016938 @ =gUnknown_0200E438
	mov r8, r0
	ldr r0, _0801693C @ =gUnknown_03001470
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #5
	adds r4, r4, r0
	ldrh r0, [r4, #0x26]
	movs r6, #0x4c
	muls r0, r6, r0
	add r0, r8
	movs r1, #0x3a
	ldrsh r0, [r0, r1]
	bl sub_0801DAE8
	ldrh r0, [r4, #0x26]
	muls r0, r6, r0
	add r0, r8
	ldr r1, _08016940 @ =0x0000FFFF
	strh r1, [r0, #0x3a]
	mov r4, sp
	adds r0, r5, #0
	mov r1, sp
	bl sub_0801566C
	ldrb r1, [r4, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r4, #3]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x10
	ands r0, r1
	strb r0, [r4, #3]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl sub_08015608
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08016938: .4byte gUnknown_0200E438
_0801693C: .4byte gUnknown_03001470
_08016940: .4byte 0x0000FFFF

