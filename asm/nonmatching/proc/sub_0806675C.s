	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806675C
sub_0806675C: @ 0x0806675C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x26]
	subs r0, #1
	strh r0, [r4, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _08066774
	ldr r0, _080667A4 @ =gUnknown_08580D0C
	bl sub_0806377C
_08066774:
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	cmp r0, #3
	bne _080667CC
	ldr r3, _080667A8 @ =gUnknown_08580934
	ldr r1, [r3]
	ldrb r2, [r1, #8]
	cmp r2, #2
	bne _080667B4
	adds r1, #0x30
	movs r0, #0
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, #0x26
	strb r2, [r0]
	ldr r0, _080667AC @ =gUnknown_08580AF0
	ldr r1, _080667B0 @ =sub_08065F78
	bl sub_08063A00
	bl sub_080654E8
	bl sub_08064A44
	b _080667EC
	.align 2, 0
_080667A4: .4byte gUnknown_08580D0C
_080667A8: .4byte gUnknown_08580934
_080667AC: .4byte gUnknown_08580AF0
_080667B0: .4byte sub_08065F78
_080667B4:
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080667F4 @ =gUnknown_08580AF0
	bl sub_0806377C
	ldr r0, _080667F8 @ =gUnknown_08580B90
	bl sub_0806377C
	ldr r0, _080667FC @ =gUnknown_08580BC8
	bl sub_0806377C
_080667CC:
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080667EC
	ldr r0, _08066800 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	ldr r0, _08066804 @ =gUnknown_08580934
	ldr r1, [r0]
	adds r1, #0x2d
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bl sub_08030178
_080667EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080667F4: .4byte gUnknown_08580AF0
_080667F8: .4byte gUnknown_08580B90
_080667FC: .4byte gUnknown_08580BC8
_08066800: .4byte gUnknown_03001FBC
_08066804: .4byte gUnknown_08580934

