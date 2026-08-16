	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005AA0
sub_08005AA0: @ 0x08005AA0
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r6, _08005B0C @ =gUnknown_08499578
	ldr r2, [r6]
	ldr r3, _08005B10 @ =0x000009F5
	movs r5, #0x80
	lsls r5, r5, #8
	str r5, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r0, #8
	movs r1, #4
	bl sub_08014A5C
	ldr r2, [r6]
	ldr r3, _08005B14 @ =0x000009F6
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #8
	movs r1, #6
	bl sub_08014A5C
	ldr r2, [r6]
	ldr r3, _08005B18 @ =0x000009F7
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #8
	movs r1, #8
	bl sub_08014A5C
	ldr r2, [r6]
	ldr r3, _08005B1C @ =0x000009F8
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #8
	movs r1, #0xa
	bl sub_08014A5C
	ldr r2, [r6]
	ldr r3, _08005B20 @ =0x000009F9
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #8
	movs r1, #0xc
	bl sub_08014A5C
	bl sub_08013AEC
	bl sub_080059E4
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08005B0C: .4byte gUnknown_08499578
_08005B10: .4byte 0x000009F5
_08005B14: .4byte 0x000009F6
_08005B18: .4byte 0x000009F7
_08005B1C: .4byte 0x000009F8
_08005B20: .4byte 0x000009F9

