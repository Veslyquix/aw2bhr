	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806A31C
sub_0806A31C: @ 0x0806A31C
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	movs r0, #0x58
	subs r1, r0, r1
	cmp r1, #0x16
	beq _0806A36C
	cmp r1, #0x16
	bgt _0806A336
	cmp r1, #0
	beq _0806A340
	b _0806A41C
_0806A336:
	cmp r1, #0x2c
	beq _0806A3A4
	cmp r1, #0x42
	beq _0806A3E4
	b _0806A41C
_0806A340:
	movs r0, #0x15
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r0, #0
	movs r1, #0xb
	movs r2, #0x3c
	movs r3, #0x46
	bl sub_08067ED0
	movs r0, #0xa0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0xb
	movs r1, #0x68
	b _0806A3D6
_0806A36C:
	ldr r0, _0806A3A0 @ =gUnknown_08581108
	bl Proc_EndEach
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r1, #0xc
	movs r2, #0xb4
	movs r3, #0xaa
	bl sub_08067ED0
	movs r0, #0xa0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0xc
	movs r1, #8
	b _0806A3D6
	.align 2, 0
_0806A3A0: .4byte gUnknown_08581108
_0806A3A4:
	ldr r0, _0806A3E0 @ =gUnknown_08581108
	bl Proc_EndEach
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r0, #0
	movs r1, #0xd
	movs r2, #0x3c
	movs r3, #0x46
	bl sub_08067ED0
	movs r0, #0xa0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0xd
	movs r1, #0x48
_0806A3D6:
	movs r2, #0x78
	movs r3, #0x15
	bl sub_08068810
	b _0806A41C
	.align 2, 0
_0806A3E0: .4byte gUnknown_08581108
_0806A3E4:
	ldr r0, _0806A428 @ =gUnknown_08581108
	bl Proc_EndEach
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	movs r1, #0xe
	movs r2, #0xb4
	movs r3, #0xaa
	bl sub_08067ED0
	movs r0, #0xa0
	lsls r0, r0, #2
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0xe
	movs r1, #8
	movs r2, #0x78
	movs r3, #0x15
	bl sub_08068810
_0806A41C:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _0806A42C
	subs r0, #1
	str r0, [r4, #0x2c]
	b _0806A438
	.align 2, 0
_0806A428: .4byte gUnknown_08581108
_0806A42C:
	ldr r0, _0806A440 @ =gUnknown_08581108
	bl Proc_EndEach
	adds r0, r4, #0
	bl Proc_Break
_0806A438:
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A440: .4byte gUnknown_08581108

