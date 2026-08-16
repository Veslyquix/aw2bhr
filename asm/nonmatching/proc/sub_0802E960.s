	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E960
sub_0802E960: @ 0x0802E960
	push {r4, lr}
	ldr r0, _0802E9F0 @ =gUnknown_0849D16C
	bl sub_08012C58
	bl sub_0803B37C
	bl Proc_Init
	bl sub_08015184
	ldr r2, _0802E9F4 @ =gUnknown_030030CC
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	subs r1, #0x10
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r2, _0802E9F8 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	strb r0, [r2]
	ldr r1, _0802E9FC @ =gUnknown_03002020
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _0802EA00 @ =gUnknown_03002B28
	movs r4, #0
	strh r4, [r0]
	ldr r0, _0802EA04 @ =gUnknown_03001FFC
	strh r4, [r0]
	ldr r0, _0802EA08 @ =gUnknown_0816DB88
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #8
	bl CpuFastSet
	ldr r0, _0802EA0C @ =gUnknown_0849B020
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl sub_08011CAC
	ldr r0, _0802EA10 @ =gUnknown_0849B024
	ldr r0, [r0]
	ldr r1, _0802EA14 @ =0x06007000
	bl sub_08011CAC
	ldr r0, _0802EA18 @ =gUnknown_03001FF8
	strh r4, [r0]
	ldr r0, _0802EA1C @ =gUnknown_03001418
	strh r4, [r0]
	bl sub_080128D0
	ldr r0, _0802EA20 @ =sub_0802E940
	bl sub_080366C4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E9F0: .4byte gUnknown_0849D16C
_0802E9F4: .4byte gUnknown_030030CC
_0802E9F8: .4byte gUnknown_030030E0
_0802E9FC: .4byte gUnknown_03002020
_0802EA00: .4byte gUnknown_03002B28
_0802EA04: .4byte gUnknown_03001FFC
_0802EA08: .4byte gUnknown_0816DB88
_0802EA0C: .4byte gUnknown_0849B020
_0802EA10: .4byte gUnknown_0849B024
_0802EA14: .4byte 0x06007000
_0802EA18: .4byte gUnknown_03001FF8
_0802EA1C: .4byte gUnknown_03001418
_0802EA20: .4byte sub_0802E940

