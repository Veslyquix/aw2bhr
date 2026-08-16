	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066808
sub_08066808: @ 0x08066808
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x26]
	subs r0, #1
	strh r0, [r4, #0x26]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _08066820
	ldr r0, _08066868 @ =gUnknown_08580D0C
	bl sub_0806377C
_08066820:
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	cmp r0, #3
	bne _08066840
	movs r0, #0x67
	bl sub_0803B4DC
	bl sub_080654E8
	bl sub_08064A44
	ldr r0, _0806686C @ =gUnknown_08580934
	ldr r0, [r0]
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
_08066840:
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08066860
	ldr r0, _08066870 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	ldr r0, _0806686C @ =gUnknown_08580934
	ldr r1, [r0]
	adds r1, #0x2d
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	bl sub_08030178
_08066860:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066868: .4byte gUnknown_08580D0C
_0806686C: .4byte gUnknown_08580934
_08066870: .4byte gUnknown_03001FBC

