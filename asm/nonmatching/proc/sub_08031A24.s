	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031A24
sub_08031A24: @ 0x08031A24
	push {r4, r5, r6, lr}
	ldr r0, _08031A70 @ =gUnknown_03004008
	ldr r5, [r0]
	movs r0, #0xf
	ands r5, r0
	ldr r6, _08031A74 @ =gUnknown_08090D10
	cmp r5, #0
	bne _08031A5E
	ldr r0, _08031A78 @ =gUnknown_02025760
	movs r1, #0xab
	strb r1, [r0]
	ldr r4, [r6]
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r5, [r0, #2]
	movs r1, #0x84
	bl sub_0802F588
	ldr r0, _08031A7C @ =gUnknown_0202575C
	movs r1, #0xaa
	strb r1, [r0]
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r5, [r0, #2]
	movs r1, #4
	bl sub_0802F588
_08031A5E:
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r1, _08031A80 @ =gUnknown_030044C4
	ldrb r2, [r0, #9]
	ldrb r0, [r1]
	cmp r2, r0
	beq _08031A84
	movs r0, #1
	b _08031A8E
	.align 2, 0
_08031A70: .4byte gUnknown_03004008
_08031A74: .4byte gUnknown_08090D10
_08031A78: .4byte gUnknown_02025760
_08031A7C: .4byte gUnknown_0202575C
_08031A80: .4byte gUnknown_030044C4
_08031A84:
	ldr r0, _08031A94 @ =gUnknown_0300410C
	ldr r1, _08031A98 @ =gUnknown_030040CC
	ldrh r1, [r1]
	strh r1, [r0]
	movs r0, #0
_08031A8E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08031A94: .4byte gUnknown_0300410C
_08031A98: .4byte gUnknown_030040CC

