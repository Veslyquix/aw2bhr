	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08086EB0
sub_08086EB0: @ 0x08086EB0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_08013C54
	ldr r0, _08086EEC @ =gUnknown_02027F74
	adds r0, #4
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, #0xb3
	bhi _08086EFE
	bl sub_0803CA54
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08086EF8
	ldr r4, _08086EF0 @ =gUnknown_08616D1C
	adds r0, r4, #0
	bl Proc_EndEach
	ldr r0, _08086EF4 @ =gUnknown_08616D6C
	bl Proc_EndEach
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
	adds r0, #0x66
	strh r5, [r0]
	b _08086F2A
	.align 2, 0
_08086EEC: .4byte gUnknown_02027F74
_08086EF0: .4byte gUnknown_08616D1C
_08086EF4: .4byte gUnknown_08616D6C
_08086EF8:
	ldrb r0, [r4]
	cmp r0, #0xb3
	bls _08086F2A
_08086EFE:
	ldr r4, _08086F34 @ =gUnknown_08616D1C
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08086F10
	adds r0, r4, #0
	bl Proc_EndEach
_08086F10:
	ldr r4, _08086F38 @ =gUnknown_08616D6C
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08086F22
	adds r0, r4, #0
	bl Proc_EndEach
_08086F22:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
_08086F2A:
	bl sub_08013AFC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086F34: .4byte gUnknown_08616D1C
_08086F38: .4byte gUnknown_08616D6C

