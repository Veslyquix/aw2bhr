	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F19C
sub_0801F19C: @ 0x0801F19C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	bl sub_0801F3D4
	adds r1, r0, #0
	ldr r2, _0801F1E4 @ =gUnknown_0848B780
	lsls r0, r6, #2
	adds r0, r0, r2
	ldrb r2, [r0]
	ldrb r0, [r0, #1]
	adds r4, r2, #0
	muls r4, r0, r4
	adds r0, r6, #0
	bl sub_0801F444
	adds r3, r0, #0
	ldr r0, _0801F1E8 @ =0x000003FF
	ands r5, r0
	lsls r5, r5, #5
	mov r2, r8
	adds r1, r2, r5
	ands r4, r0
	lsls r2, r4, #5
	lsrs r2, r2, #2
	adds r0, r3, #0
	bl CpuFastSet
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F1E4: .4byte gUnknown_0848B780
_0801F1E8: .4byte 0x000003FF

