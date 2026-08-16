	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080059FC
sub_080059FC: @ 0x080059FC
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r5, _08005A88 @ =gUnknown_08499578
	ldr r0, [r5]
	movs r1, #0x14
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r1, #0
	movs r2, #0
	movs r3, #0x1e
	bl sub_08012BC8
	ldr r2, [r5]
	ldr r3, _08005A8C @ =0x000009EF
	movs r6, #0x80
	lsls r6, r6, #8
	str r6, [sp]
	str r4, [sp, #4]
	movs r0, #3
	movs r1, #3
	bl sub_08014A5C
	ldr r2, [r5]
	movs r3, #0x9f
	lsls r3, r3, #4
	str r6, [sp]
	str r4, [sp, #4]
	movs r0, #4
	movs r1, #5
	bl sub_08014A5C
	ldr r2, [r5]
	ldr r3, _08005A90 @ =0x000009F1
	str r6, [sp]
	str r4, [sp, #4]
	movs r0, #4
	movs r1, #7
	bl sub_08014A5C
	ldr r2, [r5]
	ldr r3, _08005A94 @ =0x000009F2
	str r6, [sp]
	str r4, [sp, #4]
	movs r0, #3
	movs r1, #9
	bl sub_08014A5C
	ldr r2, [r5]
	ldr r3, _08005A98 @ =0x000009F3
	str r6, [sp]
	str r4, [sp, #4]
	movs r0, #4
	movs r1, #0xb
	bl sub_08014A5C
	ldr r2, [r5]
	ldr r3, _08005A9C @ =0x000009F4
	str r6, [sp]
	str r4, [sp, #4]
	movs r0, #4
	movs r1, #0xd
	bl sub_08014A5C
	bl sub_08013AEC
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005A88: .4byte gUnknown_08499578
_08005A8C: .4byte 0x000009EF
_08005A90: .4byte 0x000009F1
_08005A94: .4byte 0x000009F2
_08005A98: .4byte 0x000009F3
_08005A9C: .4byte 0x000009F4

