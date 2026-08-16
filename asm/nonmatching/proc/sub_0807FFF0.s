	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807FFF0
sub_0807FFF0: @ 0x0807FFF0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08080034 @ =gUnknown_081D9380
	ldr r2, [r0]
	ldrh r1, [r2]
	adds r3, r0, #0
	cmp r1, #0
	beq _0808001A
	ldr r0, _08080038 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0808001A
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
	ldr r1, _0808003C @ =gUnknown_03002B28
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0808001A:
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r0, #0
	bne _08080040
	bl sub_08013C00
	bl sub_08013AEC
	adds r0, r4, #0
	bl Proc_Break
	b _08080052
	.align 2, 0
_08080034: .4byte gUnknown_081D9380
_08080038: .4byte gUnknown_03004008
_0808003C: .4byte gUnknown_03002B28
_08080040:
	ldr r2, _08080060 @ =gUnknown_030030E0
	ldrh r1, [r2]
	ldr r0, _08080064 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_08080052:
	ldr r1, _08080068 @ =gUnknown_03001FF8
	ldrh r0, [r1]
	adds r0, #0x18
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080060: .4byte gUnknown_030030E0
_08080064: .4byte 0x0000E0FF
_08080068: .4byte gUnknown_03001FF8

