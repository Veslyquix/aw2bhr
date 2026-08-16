	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08069044
sub_08069044: @ 0x08069044
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	movs r0, #0xb4
	subs r0, r0, r1
	cmp r0, #0x40
	beq _0806908A
	cmp r0, #0x40
	bgt _08069062
	cmp r0, #0xf
	beq _08069076
	cmp r0, #0x32
	beq _08069084
	b _08069134
_08069062:
	cmp r0, #0x74
	beq _080690F8
	cmp r0, #0x74
	bgt _08069070
	cmp r0, #0x44
	beq _080690B0
	b _08069134
_08069070:
	cmp r0, #0x78
	beq _08069118
	b _08069134
_08069076:
	movs r0, #0
	movs r1, #1
	movs r2, #0x32
	adds r3, r4, #0
	bl sub_08067BD0
	b _08069134
_08069084:
	bl sub_08067A24
	b _08069134
_0806908A:
	ldr r0, _080690A8 @ =gUnknown_030020C0
	ldr r2, _080690AC @ =0x00007FFF
	adds r0, #2
	movs r1, #0xe
_08069092:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08069092
	bl sub_080135A4
	bl sub_080677E8
	b _08069134
	.align 2, 0
_080690A8: .4byte gUnknown_030020C0
_080690AC: .4byte 0x00007FFF
_080690B0:
	ldr r0, _080690F0 @ =gUnknown_0823BDE0
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	movs r0, #0
	movs r1, #0
	movs r2, #0xe
	adds r3, r4, #0
	bl sub_08067D04
	movs r2, #0x90
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	ldr r0, _080690F4 @ =0xFFFFC000
	str r0, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #8]
	movs r0, #0xc0
	str r0, [sp, #0xc]
	movs r0, #0xc
	str r0, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r0, #0
	movs r1, #1
	movs r3, #0x80
	bl sub_080679D8
	b _08069134
	.align 2, 0
_080690F0: .4byte gUnknown_0823BDE0
_080690F4: .4byte 0xFFFFC000
_080690F8:
	ldr r0, _08069110 @ =gUnknown_030020C0
	ldr r2, _08069114 @ =0x00007FFF
	adds r0, #2
	movs r1, #0xe
_08069100:
	strh r2, [r0]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08069100
	bl sub_080135A4
	b _08069134
	.align 2, 0
_08069110: .4byte gUnknown_030020C0
_08069114: .4byte 0x00007FFF
_08069118:
	ldr r0, _08069140 @ =gUnknown_0823BDE0
	movs r1, #0
	movs r2, #0x20
	bl sub_08013618
	movs r0, #0x32
	bl sub_08067C7C
	bl sub_0806780C
	bl sub_08067A24
	bl sub_08067D4C
_08069134:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _08069144
	subs r0, #1
	str r0, [r4, #0x2c]
	b _0806914A
	.align 2, 0
_08069140: .4byte gUnknown_0823BDE0
_08069144:
	adds r0, r4, #0
	bl Proc_Break
_0806914A:
	add sp, #0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

