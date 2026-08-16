	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08023824
sub_08023824: @ 0x08023824
	ldr r1, _08023858 @ =gUnknown_03004090
	ldr r2, _0802385C @ =gUnknown_030032C4
	ldrh r0, [r1]
	ldrh r3, [r2]
	cmp r0, r3
	bhs _08023834
	adds r0, #1
	strh r0, [r1]
_08023834:
	ldrh r0, [r1]
	ldrh r3, [r2]
	cmp r0, r3
	bls _08023840
	subs r0, #1
	strh r0, [r1]
_08023840:
	ldrh r0, [r1, #2]
	ldrh r2, [r2, #2]
	cmp r0, r2
	bhs _0802384C
	adds r0, #1
	strh r0, [r1, #2]
_0802384C:
	ldrh r0, [r1, #2]
	cmp r0, r2
	bls _08023856
	subs r0, #1
	strh r0, [r1, #2]
_08023856:
	bx lr
	.align 2, 0
_08023858: .4byte gUnknown_03004090
_0802385C: .4byte gUnknown_030032C4

