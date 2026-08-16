	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08011FF0
sub_08011FF0: @ 0x08011FF0
	push {r4, r5, lr}
	sub sp, #8
	ldr r4, _0801200C @ =gUnknown_0808E51C
	ldr r1, [r4]
	ldrh r0, [r1]
	adds r5, r4, #0
	cmp r0, #0
	bne _08012002
	b _0801218E
_08012002:
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	ldrh r0, [r1]
	b _0801217A
	.align 2, 0
_0801200C: .4byte gUnknown_0808E51C
_08012010:
	ldr r2, _08012038 @ =gUnknown_0808E520
	ldr r3, [r2]
	ldr r0, [r4]
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #0xa]
	cmp r0, #5
	bls _0801202C
	b _0801216E
_0801202C:
	lsls r0, r0, #2
	ldr r1, _0801203C @ =_08012040
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012038: .4byte gUnknown_0808E520
_0801203C: .4byte _08012040
_08012040: @ jump table
	.4byte _08012058 @ case 0
	.4byte _08012058 @ case 1
	.4byte _08012094 @ case 2
	.4byte _080120D2 @ case 3
	.4byte _080120FE @ case 4
	.4byte _08012138 @ case 5
_08012058:
	ldr r4, [r2]
	ldr r3, [r5]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldrh r2, [r3]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r4, #4
	adds r1, r1, r2
	ldr r1, [r1]
	ldrh r3, [r3]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r2, [r2, #8]
	bl sub_08011C68
	b _0801216E
_08012094:
	ldr r4, [r2]
	ldr r3, [r5]
	ldrh r1, [r3]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldrh r2, [r3]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r4, #4
	adds r1, r1, r2
	ldr r1, [r1]
	ldrh r3, [r3]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r2, [r2, #8]
	lsrs r2, r2, #1
	bl CpuSet
	b _0801216E
_080120D2:
	ldr r3, [r2]
	ldr r2, [r5]
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r3, #4
	adds r1, r1, r3
	ldr r1, [r1]
	bl sub_08011CAC
	b _0801216E
_080120FE:
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r3, [r2]
	ldr r2, [r5]
	ldrh r1, [r2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, [r0]
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrh r2, [r0, #8]
	lsrs r2, r2, #1
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl CpuSet
	b _0801216E
_08012138:
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #4
	ldr r4, [r2]
	ldr r3, [r5]
	ldrh r2, [r3]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	ldr r1, [r1]
	ldrh r3, [r3]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r2, [r2, #8]
	lsrs r2, r2, #2
	movs r3, #0x80
	lsls r3, r3, #0x11
	orrs r2, r3
	bl CpuFastSet
_0801216E:
	ldr r0, [r5]
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	adds r4, r5, #0
	ldrh r0, [r0]
_0801217A:
	lsls r0, r0, #0x10
	cmp r0, #0
	blt _08012182
	b _08012010
_08012182:
	bl sub_08011C18
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
_0801218E:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

